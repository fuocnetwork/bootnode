FROM fuocnetwork/go-ethereum

ENV IP=127.0.0.1 \
  PORT=30301 \
  ID=145 \
  STATS_NAME=fuoc-poa-node \
  STATS_SECRET=secret \
  STATS_HOST=127.0.0.1 \
  STATS_PORT=3000

RUN echo 'geth --networkid $ID --port $PORT --ethstats $STATS_NAME:$STATS_SECRET@$STATS_HOST:$STATS_PORT --syncmode full --maxpeers 200 --miner.gasprice 30000000000 --miner.gaslimit 20000000 --txpool.nolocals --txpool.accountslots 16 --txpool.globalslots 131072 --txpool.accountqueue 16 --txpool.globalqueue 131072 --txpool.lifetime "1h30m0s" --metrics --nat extip:$IP --http --http.addr 0.0.0.0 --http.port 8545 --http.corsdomain "*" --http.vhosts "*" --http.api personal,eth,web3,net,txpool,debug --ws --ws.addr 0.0.0.0 --ws.port 8546 --ws.origins "*" --ws.api personal,eth,web3,net,txpool,debug' >> geth.sh

ENTRYPOINT ["/bin/sh", "geth.sh"]
