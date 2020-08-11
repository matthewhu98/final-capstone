<template>
  <div class="title container landmark-page search-background">
    <div class="card">
      
      <landmark-list class="landmark-card"></landmark-list>
    </div>
  </div>
</template>

<script>
import LandmarkList from "@/components/LandmarkList.vue";
export default {
  name: "the-landmarks",
  components: {
    LandmarkList,
  }
};
</script>

<style>
.search-background {
 background-image: url(../assets/background-search.jpg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 100vw;
  min-width: 420px;
  height: 100vh;
  width: 100vw;
  position: center;
}
</style>