<template>
  <div class="title container landmark-page">
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


/* .title {
  color: black;
}

.landmark-card {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
} */
</style>