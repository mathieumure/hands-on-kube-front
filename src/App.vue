<template>
  <div id="app">
    <WhoAmi/>
  </div>
</template>

<script>
import WhoAmi from "./components/WhoAmi";

export default {
  name: "app",
  components: {
    WhoAmi
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
