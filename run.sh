git clone https://github.com/jgao/alpaca.git
cd alpaca

gsutil cp gs://catan-secrets/* .

sudo apt update
sudo apt -y install python3-pip

sudo  pip3 install alpaca_trade_api
