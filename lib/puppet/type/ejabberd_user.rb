Puppet::Type.newtype(:ejabberd_user) do
  @doc = 'Manage an ejabberd user'

  ensurable

  newparam(:name, :namevar => true) do
    desc 'The name of the user'
  end

  newparam(:host) do
    desc 'The host of the user'
  end

  newproperty(:password) do
    desc 'The password of the user'
  end

end