<template>
  <div>
      <h1>{{this.$store.state.activeLandmark.name}}</h1>
      <p>{{this.$store.state.activeLandmark.discription}}</p>
      <!-- <div>
          <img v-bind:src="getImageUrl(this.$store.state.activeLandmark.img)" />
      </div> -->
      
      

  </div>
</template>

<script>
import LandmarkService from '../services/LandmarkService'
export default {
    name: "landmark-details",
    props: {
        landmarkID: Number
    },
    // methods:{
    //     getImageUrl(pic){
    //         return require('@/assets/' + pic)
    //     }
    // },
    created(){
        LandmarkService.getLandmark(this.landmarkID).then(response =>{
            this.$store.commit("SET_ACTIVE_LANDMARK" , response.data);
        })
    }

        
    

}
</script>

<style>

</style>