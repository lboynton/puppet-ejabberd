Puppet::Type.type(:ejabberd_user).provide(:ejabberd) do
  desc 'Manages ejabberd users'
  commands :ejabberdctl => 'ejabberdctl'

  def create
    ejabberdctl(['register', @resource.value(:name), @resource.value(:host), @resource.value(:password)])
  end

  def destroy
    ejabberdctl(['unregister', @resource.value(:name), @resource.value(:host)])
  end

  def exists?
    users = ejabberdctl(['registered_users', @resource.value(:host)]).split(/\n/)
    exists = false
    users.each do |user|
      exists = user == @resource.value(:name)
    end
    exists
  end

  def password
    ejabberdctl(['set-password', @resource.value(:name), @resource.value(:host), @resource.value(:password)])
  end

end