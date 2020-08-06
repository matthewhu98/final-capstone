<template>
  <div>
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />
    <div v-for="itinerary in this.$store.state.itineraries" v-bind:key="itinerary.itineraryID">
      <h1>{{itinerary.name}}</h1>
    </div>
    <div>
      <button v-on:click="showForm= !showForm">{{showForm === true ? "Cancel": "Create Itinerary"}} </button>
    </div>
    <div class="form" v-if="showForm === true">
      <form v-on:submit.prevent>
        <label for="title">Itinerary Title</label>
        <input type="text" name="title" v-model="itinerary.name" />
        <div class="actions">
          <button type="submit" v-on:click="saveItinerary()"> Submit Itinerary</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import LandmarkService from "../services/LandmarkService";

export default {
  name: "itinerary-list",
  data() {
    return {
      itinerary: {
        name: "",
        userID: this.$store.state.user.id
      },
      showForm: false
    };
  },
  methods: {
    getItinerary(userId) {
      LandmarkService.getItinerary(userId).then(response => {
        this.$store.commit("SET_ITINERARIES", response.data);
      });
    },
    
    saveItinerary() {
      LandmarkService.createItinerary(this.itinerary , this.itinerary.userID).then((response) =>{
        if(response.status === 201){
          
          this.$router.push('/landmarks');  
        }
      });
      this.showForm =false;
      this.reloadPage();
    },
    reloadPage(){
      window.location.reload();
    }
  
  },
  created() {
    this.getItinerary(this.$store.state.user.id);
  }
}
</script>

<style>
.text {
  color: black;
}
</style>