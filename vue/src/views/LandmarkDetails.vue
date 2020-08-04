<template>
  <div>
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

</style>