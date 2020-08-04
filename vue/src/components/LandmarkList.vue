<template>
  <div>
   <landmark-details v-for="location in landmarkList"
   v-bind:key="location.name"
   v-bind:location="location">

   </landmark-details>
  </div>
</template>

<script>
import LandmarkDetails from "@/components/LandmarkDetails.vue";
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",
  components: {
      LandmarkDetails
  },
  data() {
    return {
      landmarks: []
    };
  },
  created(){
    LandmarkService.list().then((response) =>{
      this.landmarks = response.data;
    }); 
  },
 // computed: {
      // locationList(){
      //     const locationArray = this.$store.state.locations;
      //     return locationArray;
      // }

      
  //}
  computed:{
    landmarkList(){
      return this.landmarks;
    }
    
  }


};
</script>

<style>
</style>