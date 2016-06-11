ko = URI::encode("#{@title}")
page = Nokogiri::HTML(open('http://search.bugs.co.kr/track?q='+ ko).read , nil, 'utf-8')


if page.css('a.trackInfo')[0] != nil
  @nokogiri = page.css('a.trackInfo')[0]['href']

  new_page = Nokogiri::HTML(open("#{@nokogiri}").read , nil, 'utf-8')

  @lylic = new_page.css('div.lyricsContainer').css('p').to_s.html_safe
  @thumnail = new_page.css('img')[0]['src']

else
  @nokogiri = "검색 결과 없음"
end




