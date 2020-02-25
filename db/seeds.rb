areas_of_situations = ["test1", "test2", "test3",  "Minecraft", "ゼルダ", "マリオ", "LOL" ]

areas_of_situations.each do |name|
  Gametitle.create(name: name)
end