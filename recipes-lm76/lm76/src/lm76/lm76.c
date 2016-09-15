#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <endian.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <linux/i2c-dev.h>

#define    LM75_ADDR 0x48 

int handle  = 0;
int i2c_bus = 0;

int i2c_write( void *buf, int len )
{
    int rc = -1;
    
    if ( write( handle, buf, len ) != len )
    {
        printf( "I2C write failed: %s\n", strerror( errno ) );
    }
    else
    {
        rc = 0;
    }
    
    return rc;
}

int i2c_read( void *buf, int len )
{
    int rc = 0;

    if ( read( handle, buf, len ) != len )
    {
        rc = -1;
    }

    return rc;
}

int main( int argc, char *argv[] )
{
    unsigned char b[ 2 ];
    char filename[ 20 ];

    snprintf( filename, 19, "/dev/i2c-%d", i2c_bus );
    handle = open( filename, O_RDWR );
    if ( handle < 0 )
    {
        fprintf( stderr, "Error opening device: %s\n", strerror( errno ) );
        exit( 1 );
    }

    if ( ioctl( handle, I2C_SLAVE, LM75_ADDR ) < 0 )
    {
        fprintf( stderr, "IOCTL Error: %s\n", strerror( errno ) );
        exit( 1 );
    }

    if ( i2c_read( b, 2 ) == 0 )
    {
        float tf, tc;
        int t = ( b[0] << 3 ) | ( b[1] >> 5 );

        tc = t * 0.125;
        // multiply by 9, divide by 5, add 32
        tf = ( tc * 1.8 ) + 32.0;

        printf(" %f C, %f F\n", tc, tf );
    }

    close( handle );
    return 0;
}

