# Setup
Create credentials.py with the following:
```python
API_KEY = "api_key"
API_SECRET = "api_secret"
APCA_API_BASE_URL = "https://paper-api.alpaca.markets"
```
TODO: fill out steps for scripts and deployment steps


# Quick link
Startup log:
`sudo journalctl -u google-startup-scripts.service`


# Wishlist
## Strategy
- hold stock for more than 1 epoch, neutralize when it's swung
- longer look back period
- no point in sell and buy in the same session - allow diff transaction

## Infra
- experimentation system that allows multiple strategies to be run - A/B
- DB integration to track trades
- backtesting system - how do we get the data, abstraction of strategy?
- system to alert if bot fails. slack integration? allows human decision input through integration  
