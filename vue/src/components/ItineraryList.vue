<template>
  <div class="travel-list">
    <div class="itinerary-header">Your Itineraries</div>
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
      <button class="create-button" v-on:click="showForm= !showForm">{{showForm === true ? "Cancel": "Create Itinerary"}}</button>
    </div>
    <div class="form" v-if="showForm === true">
      <form v-on:submit.prevent>
        <input class="itinerary-name" type="text" name="title" v-model="itinerary.name" />
        <div class="actions">
          <button type="submit" class="submit-button" v-on:click="saveItinerary()">Submit Itinerary</button>
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

.itinerary-name {
  border: 2px solid white;
  border-radius: 10%;
  height: 1.5vw;
  width: 20vw;
  border-radius: var(--rad);
  transition: all var(--dur) var(--bez);
  transition-property: width, border-radius;
  height: 2.5vw;
  background-color: #b4c2c5;
  padding: 10px;
  margin: 20px;
  font-family: "Open Sans", sans-serif;
}

.list-of-trips {
 display: grid;
  grid-template-columns:  0.5rem 0.1rem;
  grid-template: ". itinerary-title";
  padding: 10px;
  margin: 10px;
    
}
.itinerary-title {
  color: #b18f69;
  text-transform: uppercase;
  font-size: 20px;
  padding: 15px;
  border-radius: 6px;
  display: inline-block;
  text-decoration: none;

}
.itinerary-title:hover {
  color: #5ba1b0;
}

.travel-list {
  color: black;
  font-family: "Open Sans", sans-serif;
  width: 75%;
  margin: auto auto auto auto;
  justify-content: center;
}

.fa-trash-alt:hover {
  color: #5ba1b0;
}

.travel-list {
  visibility: visible;
  opacity: 1;
  background: rgba(255, 255, 255, 0.5);
  width: 600px;
  padding: 60px;
  margin: auto;
}

.itinerary-header {
  font-family: "Poiret One", cursive;
  letter-spacing: 2px;
  position: relative;
  text-align: center;
  font-size: 6vh;
  margin: 20px;
  color: #5ba1b0;
}

.create-button,
.submit-button {
  color: #b18f69;
  text-transform: uppercase;
  font-size: 20px;
  padding: 15px;
  display: inline-block;
  text-decoration: none;
}

.create-button:hover,
.submit-button:hover {
  background: #5ba1b0;
  color: white;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -ms-transition: all 0.3s;
  transition: all 0.3s;
  backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  /* Chrome and Safari */
  -moz-backface-visibility: hidden;
  /* Firefox */
  -ms-backface-visibility: hidden;
  /* Internet Explorer */
}


</style>
