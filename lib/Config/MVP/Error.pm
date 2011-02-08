package Config::MVP::Error;
use Moose;

has message => (is => 'ro', isa => 'Str', required => 1);

sub as_string {
  my ($self) = @_;
  join qq{\n}, $self->message, "\n", $self->stack_trace;
}

use overload (q{""} => 'as_string');

with(
  'Throwable',
  'Role::Identifiable::HasIdent',
  'Role::HasMessage',
  'StackTrace::Auto',
);

no Moose;
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;