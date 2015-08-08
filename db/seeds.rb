# encoding: utf-8
title = ["独習javascript", "RUBYクックブック","実践 ruby on rails", 
	      "Effective RUBY", "Rubyベストプラクティス"]

authors = "Yuki Negishi"
comment =  "今持っている本たちをとりあえず列挙してみた"

title.each_with_index do |title, idx|
	if idx % 2 == 0
		judge = true
	else
		judge = false
	end 
	Book.create( title: title, authors: authors, comment: comment, 
		publish_year: Time.current.year - idx, checked_out: judge)
end 	      