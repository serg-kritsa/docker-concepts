

## Things to test once finished to ensure it's working:

* Edit ./result/server.js, save it, and ensure it restarts in nodemon
* Ensure you never see "Waiting for db" in docker-compose logs, which happens
when vote or result are waiting on db or redis to start
* Use VS Code or another editor with debugger (or `browser://inspect/#devices` url in Chrome) to connect to debugger
* Goto vote.localhost and result.localhost and ensure you can vote and see result

