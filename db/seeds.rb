# encoding: utf-8
title = ["Java1", "Java2","Java3", "Rails1", "Rails2", "Rails3", "Ruby1", "Ruby2", "Ruby2"]

authors = []
(0...title.size).each do |i|
	authors << "Yuki Negishi#{i}"
end 

comment =  "今持っている本たちをとりあえず列挙してみた" * 3

title.each_with_index do |title, idx|
	if idx % 2 == 0
		judge = true
	else
		judge = false
	end 
	Book.create( title: title, authors: authors[idx], comment: comment, 
		publish_year: Time.current.year - idx, checked_out: judge)
end 	      

colors = ["#8a2be2", "#5f9ea0", "#008b8b"]
["Java", "Ruby On Rails", "Ruby"].each_with_index do |name, idx|
	Category.create(name: name, color: colors[idx])
end 


books = Book.order('id')
categories = Category.order('id')
categories[0].books << books[0]
categories[0].books << books[1]
categories[0].books << books[2]
categories[1].books << books[3]
categories[1].books << books[4]
categories[1].books << books[5]
categories[2].books << books[6]
categories[2].books << books[7]
categories[2].books << books[8]




