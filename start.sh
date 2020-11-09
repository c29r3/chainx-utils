#!/bin/bash

/root/go/bin/chainx --chain=testnet --validator --name $(cat /root/chainx/acc.txt)
