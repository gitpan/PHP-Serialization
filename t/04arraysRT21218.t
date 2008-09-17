use strict;
use warnings;
use Test::More tests => 2;

BEGIN { use_ok('PHP::Serialization') };

my $data = PHP::Serialization::unserialize(
    q{a:1:{s:3:"lll";a:2:{i:195;a:2:{i:0;i:111;i:1;s:3:"bbb";}i:194;a:2:{i:0;i:222;i:1;s:3:"ccc";}}}}
);
{
    $TODO = 'Not currently sure about the correct representation in this, need to read the PHP manual';

    is_deeply($data,
        {
            'lll' => {
                '195' => {111 => 'bbb'},
                '194' => {222 => 'ccc'},
            }
        }
    );
}