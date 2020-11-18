require 'time'
class MarketGeneratorJob < ApplicationJob
  queue_as :default

  def perform(*args)
    images = [
     "https://images.unsplash.com/photo-1526399743290-f73cb4022f48?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80",
     "https://images.unsplash.com/photo-1550989460-0adf9ea622e2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
    "https://images.unsplash.com/photo-1572294044527-0fc2df88b603?ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80",
    "https://images.unsplash.com/photo-1519314963043-050bb85af91a?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "https://images.unsplash.com/photo-1503444786070-ab39340977f2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
    "https://images.unsplash.com/photo-1577153651485-d6f478de99d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1954&q=80",
    "https://images.unsplash.com/photo-1563263357-a04f90b8d4dc?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjF9",
    "https://d2j8c2rj2f9b78.cloudfront.net/uploads/poster-images/Farmers-Market-Getty-Images-no-credit.jpg",
    "https://phoenix.org/wp-content/uploads/2016/03/image03-1-e1467929206537.jpg",
    "https://media.ksdk.com/assets/KSDK/images/2bc65bd9-9f20-421d-93ec-cced21c205b7/2bc65bd9-9f20-421d-93ec-cced21c205b7_750x422.jpg",
    "https://www.visitstockton.org/imager/s3_us-west-1_amazonaws_com/stockton-2019/images/Miracle-Mile-Whirlows-Farmers-Market_7d1c10118a19b69585381c7256fd040d.jpeg",
    "https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_615,q_75,w_640/v1/clients/pwmva/Historic_Downtown_Manassas_Farmers_Market_26__305b0cf8-c262-455a-b827-531eac013292.jpg",
    "https://lh3.googleusercontent.com/q25IbL6CgpQRLufXk3zjJ6RzpYGhknRhLDiJCweMHl251g9rfHmQNJOgYsmcFfcFNNr-K5-fBwoNCPfC=w1080-h608-p-no-v0",
    "https://colorado-springs.s3.amazonaws.com/CMS/2597/occa_detail_pg_main_1000x667_cscvb_occa_events_-_farmers_market__wysiwyg.jpg",
    "https://www.colorado.com/sites/default/files/vailfarmersmarket.jpg",
    "https://www.twincities.com/wp-content/uploads/2020/08/jea-0005-SP-Farmers-Market.jpg?w=561",
    "https://assets.simpleviewinc.com/simpleview/image/fetch/c_fill,h_350,q_60,w_470/https://assets.simpleviewinc.com/simpleview/image/upload/crm/raleigh/Farmer-s-Market-first_7ac6798e-f8de-6e71-1c3a33379b5aecd3.jpg",
    "https://texasfarmersmarket.org/wp-content/uploads/2020/08/TFM_May2020_Lakeline-0791-980x600.jpg",
    "https://img.huffingtonpost.com/asset/5ec402582400008b0b8eb19a.jpeg?ops=scalefit_720_noupscale",
    "https://texasfarmersmarket.org/wp-content/uploads/photo-gallery/cedarparkmkt_rooftop_03_Banner.jpg?bwg=1574719356",
    "https://lh3.googleusercontent.com/proxy/jl7vgn2PQLRbSU59aaVVlxaoUMSJRAWdKzN56bpyoFqnXD92qxZ47BvrtOzjP37D6vk-Hm042VGZjV7MaDNe_X_9nNFwbFTJC5dt8U202De2iwulcTxWRTPcnEOlkufs",
    "https://images.squarespace-cdn.com/content/v1/5bf347a3a9e028260bf61642/1574867763208-08TKAGTTVUFRLEMX6YQ2/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/20191116-IMG_5153+%281%29.jpg",
    "https://ioby.org/sites/default/files/styles/gallery_large/public/cityseed%20cover%20photo.jpeg?itok=a8I4j4To",
    "https://patch.com/img/cdn/users/22845980/2016/04/raw/201604571a732e27ade.jpg",
    "https://images.unsplash.com/photo-1578167637694-5a5c45d5a322?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2767&q=80",
    "https://images.unsplash.com/photo-1501523460185-2aa5d2a0f981",
    "https://images.unsplash.com/photo-1488459716781-31db52582fe9",
    "https://images.unsplash.com/photo-1533900298318-6b8da08a523e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
    "https://images.unsplash.com/photo-1591003659159-54a5579d395e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80",
    "https://unsplash.com/photos/NvdscovENOY",
    "https://unsplash.com/photos/aRrCf_OwoCM",
    "https://images.unsplash.com/photo-1598063414123-d8fd7fb018b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
    "https://images.unsplash.com/photo-1573894158867-3b048fcb012d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
    "https://images.unsplash.com/photo-1603415188058-6e8a67b445c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1611&q=80",
    "https://images.unsplash.com/photo-1588005011879-5b79164c0cbc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1953&q=80",
    "https://images.unsplash.com/photo-1573481078935-b9605167e06b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80",
    "https://images.unsplash.com/photo-1556645427-dd4cb34092a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80",
    "https://images.unsplash.com/photo-1601333057326-afb9e17bb8b3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1570&q=80",

    ]
    markets = []
    zips = [94061]
    zips.each do |zip|
      temp_markets = []
      response = HTTP.get("https://search.ams.usda.gov/farmersmarkets/v1/data.svc/zipSearch?zip=#{zip}").parse["results"]
      response.each_with_index do |market, i|
        market_data = HTTP.get("https://search.ams.usda.gov/farmersmarkets/v1/data.svc/mktDetail?id=#{market["id"]}").parse
        temp_markets.push(market_data["marketdetails"])
        puts "market ##{i}"
        temp_markets[i]["marketname"] = market["marketname"]
      end
      markets += temp_markets
    end
    markets.each do |market|
      new_name = market["marketname"].split
      new_name.shift
      market["marketname"] = new_name.join(" ")
    end
    markets.uniq.each do |market|
      puts market["Schedule"]
      schedule = market["Schedule"]
      days = {
        "Sun" => 0,
        "Mon" => 1,
        "Tue" => 2,
        "Wed" => 3,
        "Thu" => 4,
        "Fri" => 5,
        "Sat" => 6,
      }
      day = days[schedule.split[3][0..2]]
      # date1year = schedule.split[0][6..9]
      date1year = 2020
      date1month = 11
      date1day = 18 #schedule.split[0][3..4]
      # date2year = schedule.split[2][6..9]
      date2year = 2020
      date2month = 12 #schedule.split[0][3..4]
      date2day = 18
      date1 = Date.parse("#{date1year}-#{date1month}-#{date1day}")
      puts date1
      date2 = Date.parse("#{date2year}-#{date2month}-#{date2day}")
      puts date2
      dates = (date1..date2).to_a.select {|k| day == k.wday}
      corrected_dates = dates.map do |date|
        "#{date.year}-#{date.mon}-#{date.mday}"
      end
      corrected_dates.each do |date|
        if Event.where("date = ?", date).where("name = ?", market["marketname"]).length < 1
          ### this allows you to use the same image for every market of the same name ###
          if Event.where("name = ?", market["marketname"]).length >= 1
            image_url = Event.where("name = ?", market["marketname"]).first.image_url
            Event.create(date: date, address: market["Address"], name: market["marketname"], image_url: image_url, products: market["Products"], website: market["GoogleLink"])
          else
            image_url = images[rand(0..images.length)]
            Event.create(date: date, address: market["Address"], name: market["marketname"], image_url: image_url, products: market["Products"],website: market["GoogleLink"])
          end
        end
      end
    end
  end
end

# {"Address"=>"2233 W Division St, Chicago, Illinois, 60622", "GoogleLink"=>"http://maps.google.com/?q=41.902872%2C%20-87.684396%20(%22West+Town+Health+%26+Farmers+Market%22)", "Products"=>"Baked goods; Cheese and/or dairy products; Cut flowers; Eggs; Fish and/or seafood; Fresh fruit and vegetables; Fresh and/or dried herbs; Honey; Poultry; Soap and/or body care products", "Schedule"=>"06/14/2018 to 12/13/2018 Thu: 3:00 PM-7:00 PM;<br> <br> <br> ", "marketname"=>"30.7 West Town Health & Farmers Market"}