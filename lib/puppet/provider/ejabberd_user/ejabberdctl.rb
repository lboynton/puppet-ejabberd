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
    users.each do |user|
      if user == @resource.value(:name)
        return true
      end
    end
    false
  end

  def password
    ejabberdctl(['change-password', @resource.value(:name), @resource.value(:host), @resource.value(:password)])
    @resource.value(:password)
  end

end
