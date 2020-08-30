<template>
  <div>
    <v-container fill-height>
      <div id="head">
        <h1>Binance aggTrade Stream</h1>
        <v-col>
          <v-btn @click="startStream" color="primary">Start Stream</v-btn>
        </v-col>

        <v-col>
          <v-btn @click="clearLogs" color="primary">Clear Logs</v-btn>
        </v-col>
      </div>
      <v-data-table
        :headers="headers"
        :items="trade"
        :sort-by="['E']"
        :sort-desc="[true]"
      >
      </v-data-table>
    </v-container>
  </div>
</template>

<style>
head {
  text-align: center;
}
</style>
<script>
export default {
  data() {
    return {
      headers: [
        { value: "e", text: "Event type" },
        { value: "E", text: "Event time" },
        { value: "s", text: "Symbol" },
        { value: "a", text: "Aggregate trade ID" },
        { value: "p", text: "Price" },
        { value: "q", text: "Quantity" },
        { value: "f", text: "First trade ID" },
        { value: "l", text: "Last trade ID" },
        { value: "T", text: "Trade time" },
        { value: "m", text: "Is the buyer the market maker?" },
      ],
      trade: [],
      ws: null,
      msg: {
        method: "SUBSCRIBE",
        params: ["btcusdt@aggTrade"],
        id: 1,
      },
    };
  },

  methods: {
    startStream() {
      this.ws.send(JSON.stringify(this.msg));
      this.ws.addEventListener("message", (e) => {
        this.trade.push(JSON.parse(e.data));
      });
    },
    clearLogs() {
      this.trade = [];
    },
  },
  created() {
    this.ws = new WebSocket("wss://fstream3.binance.com/ws/MARKET_DATA");
    this.ws.onopen = function() {
      console.log("Connected to websocket");
    };
    this.ws.onmessage = function() {};
  },
};
</script>
