Facter.add("application") do
  setcode do
    Facter.value(:hostname)[4..6]
  end
end

