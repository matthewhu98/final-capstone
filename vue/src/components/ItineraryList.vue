<template>
  <div class="itinerary-background">
    <div class="travel-list">
      <h1 class="itinerary-header">Your Itineraries</h1>
      <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet"
      >
      <div
        v-for="itinerary in this.$store.state.itineraries"
        v-bind:key="itinerary.itineraryID"
        class="list-of-trips"
      >
        <div>
          <router-link
            class="itinerary-title"
            v-bind:to="{name: 'itinerarydetails', params: {id: itinerary.itineraryID}}"
          >{{itinerary.name}}</router-link>
        </div>
        <div>
          <button
            class="delete-itinerary-button"
            v-on:click="deleteItiterary(itinerary.itineraryID)"
          >
            <i class="fas fa-trash-alt fa-2x"></i>
          </button>
        </div>
      </div>
      <div>
        <button
          class="create-button"
          v-on:click="showForm= !showForm"
        >{{showForm === true ? "Cancel": "Create Itinerary"}}</button>
      </div>
      <div class="form" v-if="showForm === true">
        <form v-on:submit.prevent>
          <input class="itinerary-naming" type="text" name="title" v-model="itinerary.name">
          <div class="actions">
            <button
              type="submit"
              class="submit-button"
              v-on:click="saveItinerary()"
            >Submit Itinerary</button>
          </div>
        </form>
      </div>
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
    deleteItiterary(id) {
      LandmarkService.deleteItinerary(id).then(response => {
        if (response.status === 200) {
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
.itinerary-naming {
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
  grid-template-columns: 1rem 1rem;
  grid-template: "itinerary-title delete-itinerary-button";
  padding: 10px;
  margin: 10px;
}
.itinerary-title {
  color: #b18f69;
  text-transform: uppercase;
  font-size: 25px;
  padding: 15px;
  border-radius: 6px;
  display: inline-block;
  text-decoration: none;
  float: left;
}

.itinerary-title:hover {
  color: #494949 !important;
}

.delete-itinerary-button {
  float: right;
  border: none;
  background: none;
  color: #b18f69;
  position: relative;
  top: 20px;
}

.travel-list {
  font-family: "Open Sans", sans-serif;
  background: rgba(255, 255, 255, 0.8);
  width: 600px;
  padding: 60px;
  margin: auto;
  border-radius: 4px;
  position: relative;
  top: 160px;
}

.fa-trash-alt:hover {
  color: #494949 !important;
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
  border: none;
  background: white;
  border-radius: 4px;
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

.itinerary-background {
  background-image: url(../assets/background-itinerary.jpg);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 100vw;
  min-width: 420px;
  height: 100vh;
  width: 100vw;
  background-attachment: fixed;
  max-width: 100%;
  background-size: cover;
}
</style>
