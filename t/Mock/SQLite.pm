package Mock::SQLite;
use base qw/Class::Data::Inheritable/;

__PACKAGE__->mk_classdata('dbh');

sub setup_test_db {
    my $self = shift;
    return unless $self->dbh;
    my @statements = (
        qq{
            CREATE TABLE books (
                id         INTEGER PRIMARY KEY AUTOINCREMENT,
                author_id  INT,
                name       TEXT
            )
        },
        qq{
            CREATE TABLE authors (
                id           INT,
                gender_name  TEXT,
                pref_name    TEXT,
                name         TEXT
            )
        },
        qq{
            CREATE TABLE genders (
                name  TEXT
            )
        },
        qq{
            CREATE TABLE prefectures (
                name  TEXT PRIMARY KEY
            )
        }
    );
    $self->dbh->do($_) for @statements;
}

sub clean_test_db {
    unlink './test.db';
}

1;
