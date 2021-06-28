require "csv"

while true
  puts "1(新規でメモを作成) 2(既存のメモ編集する)"
  memo_type = gets.to_i

  if memo_type == 1
    puts "ファイル名を入力してください（拡張子を除く）"
    file_title = gets.chomp
    CSV.open("#{file_title}", "w") do |text|
    puts "内容を入力してください"
    memo_contents = gets.chomp
    text << ["#{memo_contents}"]
  end
  elsif memo_type == 2
    puts "編集するファイル名を入力してください"
    file_title = gets.chomp
    p CSV.read("#{file_title}")
    CSV.open("#{file_title}", "a+") do |text|
    puts "編集内容を追加してください"
    memo_contents = gets.chomp
    text << ["#{memo_contents}"]
  end
  else memo_type < 1 || memo_type > 2
    puts "もう一度入力してください"
  end
end
