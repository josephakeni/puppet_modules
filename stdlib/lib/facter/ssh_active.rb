Facter.add("ssh_active") do
  setcode do
    kernel_release = Facter::Util::Resolution.
exec('systemctl status sshd | grep active | awk \' {print $2}\'')
  end
end

