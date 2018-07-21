module BooksHelper
  def book_link book
    html = "<a href='/books/#{book.id}'>".html_safe
    html += book.title
    if book.category
      html += ' (' + book.category.name + ')'
    end
    html += "</a>".html_safe
    html
  end
end
