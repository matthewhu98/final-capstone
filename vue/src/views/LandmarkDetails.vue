<template>
  <div class="landmark-details">
      <landmark-details v-bind:landmarkID="parseInt($route.params.id)"/>
  </div>
</template>

<script>
import LandmarkDetails from "@/components/LandmarkDetails.vue";
export default {
    name: "landmarkdetails",
    components:{
        LandmarkDetails
    }
}
</script>

<style>
.landmark-details {
  
  background-repeat: no-repeat;
  background-position: center;
  background-size: 100vw;
  min-width: 420px;
  height: 100vh;
  width: 100vw;
  position: center;
}
</style>