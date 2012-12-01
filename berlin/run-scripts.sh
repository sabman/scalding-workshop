# Scalding from GitHub
cd $HOME/fun
git clone https://github.com/twitter/scalding.git


# Build Scalding
cd $HOME/fun/scalding
sbt update
sbt assembly


# Sanity Check
cd $HOME/fun/scalding
scripts/scald.rb --local tutorial/Tutorial0.scala

ln -s scripts/scald.rb $HOME/bin/

# Run
./run.rb ./berlin/scripts/WordCount.scala \
  --input  ./data/shakespeare/plays.txt \
  --output ./output/shakespeare-wc.txt

./run.rb ./berlin/scripts/StockAverages3.scala \
    --input  data/stocks/AAPL.csv \
    --output output/AAPL-year-avg.txt


./run.rb ./berlin/scripts/StocksDividendsJoin4.scala \
  --stocks data/stocks/AAPL.csv \
  --dividends data/dividends/AAPL.csv \
  --output output/AAPL-stocks-dividends-join.txt


./run.rb ./berlin/scripts/StockCoGroup5.scala \
  --input  data/stocks \
  --output output/AAPL-INTC-GE-IBM.txt

run.rb ./berlinscripts/Twitter6.scala \
  --input  data/twitter/tweets.tsv \
  --uniques output/unique-languages.txt \
  --count_star output/count-star.txt


./run.rb ./berlin/scripts/StocksDividendsRevisited8.scala \
  --stocks-root-path    data/stocks/ \
  --dividends-root-path data/dividends/ \
  --symbols AAPL,INTC,GE,IBM \
  --output output/stocks-dividends-join.txt