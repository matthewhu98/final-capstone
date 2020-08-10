<template>
  <div class="travel-list">
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />
    <div v-for="itinerary in this.$store.state.itineraries" v-bind:key="itinerary.itineraryID" class="list-of-trips">
      <div>
        <router-link
          class="itinerary-title"
          v-bind:to="{name: 'itinerarydetails', params: {id: itinerary.itineraryID}}"
        >{{itinerary.name}}</router-link>
      </div>
      <div>
        <button class="delete-itinerary-button" v-on:click="deleteItiterary(itinerary.itineraryID)"><i class="fas fa-trash-alt fa-2x"></i></button>
      </div>
    </div>
    <div>
      <button v-on:click="showForm= !showForm">{{showForm === true ? "Cancel": "Create Itinerary"}}</button>
    </div>
    <div class="form" v-if="showForm === true">
      <form v-on:submit.prevent>
        <label for="title">Itinerary Title</label>
        <input type="text" name="title" v-model="itinerary.name" />
        <div class="actions">
          <button type="submit" v-on:click="saveItinerary()">Submit Itinerary</button>
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
      LandmarkService.createItinerary(
        this.itinerary,
        this.itinerary.userID
      ).then(response => {
        if (response.status === 201) {
          this.$router.push("/landmarks");
        }
      });
      this.showForm = false;
      this.reloadPage();
    },
    reloadPage() {
      window.location.reload();
    },
    deleteItiterary(id){
      LandmarkService.deleteItinerary(id).then(response =>{
        if(response.status === 200){
          alert("Your Trip had Been Deleted");
          this.reloadPage();

        }
      });
    }
  },
  created() {
    this.getItinerary(this.$store.state.user.id);
  }
};
</script>

<style scoped>

.list-of-trips {
 
 display: grid;
  grid-template-columns:  0.5rem 0.1rem;
  grid-template: ". itinerary-title";
  padding: 10px;
  margin: 10px;
    
   

}
.itinerary-title {
  /* grid-area: itinerary-title; */
  text-decoration: none ;
   font-family: "Poiret One", cursive;
  font-size: 25px;
  font-weight:900;
  padding:10px;
  color: white;

}
.itinerary-title:hover {
  color: saddlebrown;
}
.travel-list {
  
  color: black;
  font-family: "Open Sans", sans-serif;
  width: 75%;
  margin: 100px auto auto auto;
  justify-content: center;
}

button{
  /* border-radius: 18%;
  padding: 9px; */
  /* margin: 20px; */

}
.fa-trash-alt {
  /* size: 100px; */
  
 
  /* padding:5px; */
}
.fa-trash-alt:hover {
  filter:drop-shadow(5px 5px 5px rgba(255, 255, 255, 0.564));
  color:red;
}
</style>
