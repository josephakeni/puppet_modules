Facter.add("datacentre") do
  setcode do 
    Facter.value(:hostname)[1..2]
  end
end
