<template>
  <div>
   <div v-for="landmark in this.$store.state.landmarks"
   v-bind:key="landmark.name">
<!-- // v-bind:landmark="landmark" -->
    <router-link v-bind:to="{name: 'LandmarkDetails' , params: {id: landmark.landmarkID}}">{{landmark.name}}</router-link>
   </div>

  </div>
</template>

<script>
// import LandmarkDetails from "@/components/LandmarkDetails.vue";
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",

  methods:{
    getLandmarks(){
      LandmarkService.list().then(response =>{
        this.$store.commit("SET_LANDMARKS" , response.data);
      });
    }
  },
  
  created(){
    this.getLandmarks();
  },
 // computed: {
      // locationList(){
      //     const locationArray = this.$store.state.locations;
      //     return locationArray;
      // }

      
  //}


};
</script>

<style>
</style>