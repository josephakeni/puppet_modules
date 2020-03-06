Facter.add("environment") do
  setcode do
    Facter.value(:hostname)[3..3]
  end
end

