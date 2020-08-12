<template>
  <div class="search-background">
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
  background-attachment: fixed;
  max-width: 100%;
  background-size: cover;
}
</style>