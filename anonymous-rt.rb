#-*- coding: utf-8 -*-

Plugin.create(:anonymous_rt) do
  command(:anonymous_rt,
          name: '匿名RTする',
          description: 'RT @***: で鍵付きユーザもRTしておとしめろ! 新感覚RTバトル勃発!! 君の力で理想の監視社会を作り上げよう!!!',
#          condition: Plugin::Command[:HasOneMessage],
          condition: lambda{|x| true},
          visible: true,
          role: :timeline) do |opt| 
    message = opt.messages.first
    if message.to_s.length > 130 then
      activity :system, "匿名RT: 長すぎる。諦めるか手動でやるんだな。"
    else
      Service.primary.update(:message => "RT @***: " + message.to_s)
    end    
  end 
end
