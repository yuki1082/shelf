# encoding: utf-8

module BooksHelper
	
  def links_for(book)
  	links = Array.new
  	links << link_to("編集", [:edit, book])
  	if book.checked_out? 
  		links << link_to("在庫", [:check_in, book], method: :put)
  	else 
  		links << link_to("貸出中", [:check_out, book], method: :put)
  	end 
  	links << delete_link(book) 
  	raw(links.join(" "))
  end 
end
