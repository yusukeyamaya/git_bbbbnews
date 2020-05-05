class Scraping
  def self.team_urls
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://www.bleague.jp/standings/?tab=1&year=2020/")
    elements = current_page.search('.all-team-name a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      get_content(link)
    end
  end

  def self.get_content(link)
    agent = Mechanize.new
    page = agent.get(link)
    
    team1  = page.at('.team-logo img')[:alt] if page.at('.team-logo img')
    link1  = page.at('.list-card a').get_attribute('href') if page.at('.list-card a')
    title1 = page.at('.detail .title').inner_text if page.at('.detail .title')
    date1  = page.at('.detail .update').inner_text if page.at('.detail .update')
    
    team2  = page.at('.team-logo img')[:alt] if page.at('.team-logo img')
    link2  = page.search('.list-card a')[3].get_attribute('href') if page.search('.list-card a')[3]
    title2 = page.search('.detail .title')[1].inner_text if page.search('.detail .title')[1]
    date2  = page.search('.detail .update')[1].inner_text if page.search('.detail .update')[1]
    
    team3  = page.at('.team-logo img')[:alt] if page.at('.team-logo img')
    link3  = page.search('.list-card a')[6].get_attribute('href') if page.search('.list-card a')[6]
    title3 = page.search('.detail .title')[2].inner_text if page.search('.detail .title')[2]
    date3  = page.search('.detail .update')[2].inner_text if page.search('.detail .update')[2]
    
    team4  = page.at('.team-logo img')[:alt] if page.at('.team-logo img')
    link4  = page.search('.list-card a')[9].get_attribute('href') if page.search('.list-card a')[9]
    title4 = page.search('.detail .title')[3].inner_text if page.search('.detail .title')[3]
    date4  = page.search('.detail .update')[3].inner_text if page.search('.detail .update')[3]
    
    team5  = page.at('.team-logo img')[:alt] if page.at('.team-logo img')
    link5  = page.search('.list-card a')[12].get_attribute('href') if page.search('.list-card a')[12]
    title5 = page.search('.detail .title')[4].inner_text if page.search('.detail .title')[4]
    date5  = page.search('.detail .update')[4].inner_text if page.search('.detail .update')[4]
    
    team6  = page.at('.team-logo img')[:alt] if page.at('.team-logo img')
    link6  = page.search('.list-card a')[15].get_attribute('href') if page.search('.list-card a')[15]
    title6 = page.search('.detail .title')[5].inner_text if page.search('.detail .title')[5]
    date6  = page.search('.detail .update')[5].inner_text if page.search('.detail .update')[5]

    content1 = Content.where(link: link1).first_or_initialize
    content1.team = team1
    content1.link = link1
    content1.title = title1
    content1.date = date1
    content1.save
    
    content2 = Content.where(link: link2).first_or_initialize
    content2.team = team2
    content2.link = link2
    content2.title = title2
    content2.date = date2
    content2.save
    
    content3 = Content.where(link: link3).first_or_initialize
    content3.team = team3
    content3.link = link3
    content3.title = title3
    content3.date = date3
    content3.save
    
    content4 = Content.where(link: link4).first_or_initialize
    content4.team = team4
    content4.link = link4
    content4.title = title4
    content4.date = date4
    content4.save
    
    
    content5 = Content.where(link: link5).first_or_initialize
    content5.team = team5
    content5.link = link5
    content5.title = title5
    content5.date = date5
    content5.save
    
    content6 = Content.where(link: link6).first_or_initialize
    content6.team = team6
    content6.link = link6
    content6.title = title6
    content6.date = date6
    content6.save

  end
end