<template>
  <div v-if="loading">Loading your configuration from server</div>
  <div class="whomai" v-else>
      <h1>Geeting information from {{ this.serviceUrl }}</h1>
      <ul>
          <li>Your IP is {{ ipfrom }}</li>
          <li>Server hostname {{ hostname }}</li>
          <li>ip {{ ipto }}</li>
      </ul>
  </div>
</template>

<script>
import axios from "axios";
const CONFIG_URL = "TODO-MA-CONFIG-URL";

const parseConfig = content => {
  const lines = content.split("\n");
  const config = {};
  for (let line of lines) {
    const [key, value] = line.split("=");
    config[key] = value;
  }
  return config;
};

const fetchConfig = (url = CONFIG_URL) => {
  return axios
    .get(url)
    .then(response => response.data)
    .then(parseConfig);
};

export default {
  name: "WhoAmi",
  data() {
    return {
      hostname: "",
      ipfrom: "",
      ipto: "",
      serviceUrl: "",
      loading: true
    };
  },
  async mounted() {
    this.loading = true;
    try {
      const config = await fetchConfig();
      this.serviceUrl = config.service;
      const { hostname, ip } = await axios
        .get(this.serviceUrl)
        .then(response => response.data);
      this.hostname = hostname;
      this.ipfrom = ip[0];
      this.ipto = ip[1];
      this.loading = false;
    } catch (err) {
      this.loading = false;
      console.error(err);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  margin: 0 10px;
}
</style>
