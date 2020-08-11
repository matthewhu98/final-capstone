<template >
  <div class="container">
    <h1>List of Landmarks in Rome</h1>

    <div id="search">
      <!-- <label for="name">Where do you want to go?</label> -->
      <input type="text" class="search-bar" placeholder="Where do you want to go?" v-model="name" />
      <i class="fas fa-search"></i>
    </div>

    <div class="grid">
      <div
        class="objects container-panel"
        v-for="(landmark, index) in filterLandmark"
        v-bind:key="landmark.id"
      >
        <div class="object">
          <div class="card">
            <button
              class="button-itinerary button"
              v-on:click="landmarkToShow = index; "
            >{{landmarkToShow === index ? "Cancel": "Add"}}</button>
            <div class="bring-forward">
              <tr class="itTable" v-show="landmarkToShow === index">
                <h4>Your Itineraries</h4>
                <div
                  ref="landmarkDetails"
                  v-for="itinerary in itineraries"
                  v-bind:key="itinerary.itineraryID"
                >
                  <td>{{itinerary.name}}</td>
                  <td>
                    <input
                      type="checkbox"
                      v-bind:id="itinerary.itineraryID"
                      v-on:click="addLandmarkToIt(itinerary.itineraryID, landmark.landmarkID)"
                    />
                  </td>
                </div>
              </tr>
            </div>

            <img @click="landmarkToShow=-1" class="image" v-bind:src="getImageUrl(landmark.img)" />
            <router-link
              class="title"
              v-bind:to="{name: 'landmarkdetails', params: {id: landmark.landmarkID}}"
            >
              <h3>{{landmark.name}}</h3>
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import LandmarkService from "../services/LandmarkService";
export default {
  name: "landmark-list",
  data() {
    return {
      name: "",

      itineraryLandmark: {
        landmarkId: 0,
        itineraryId: 0
      },

      showListOfItineraries: false,
      landmarkToShow: -1,
      showButton: false
    };
  },

  methods: {
    getLandmarks() {
      LandmarkService.list().then(response => {
        this.$store.commit("SET_LANDMARKS", response.data);
      });
    },
    getImageUrl(pic) {
      return require("@/assets/" + pic);
    },
    addLandmarkToIt(id, lid) {
      this.itineraryLandmark.itineraryId = id;
      this.itineraryLandmark.landmarkId = lid;
      LandmarkService.addLandmarkToItinerary(lid, this.itineraryLandmark)
        .then(response => {
          if (response.status === 201) {
            alert("your landmark has been added");
          }
        })
        .catch(error => {
          if (error.response.status == 404) {
            this.$router.push("/not-found");
          }
        });
    }
  },
  computed: {
    filterLandmark() {
      return this.$store.state.landmarks.filter(landmark => {
        return this.name.toLowerCase() === ""
          ? true
          : landmark.name.toLowerCase().includes(this.name.toLowerCase());
      });
    },
    itineraries() {
      return this.$store.state.itineraries;
    }
  },

  created() {
    this.getLandmarks();
  }
};
</script>


<style lang="css" scoped>
@import url('https://fonts.googleapis.com/css2?family=Rock+Salt&display=swap');

.image {
  --size: 400px;
  height: calc(var(--size) * 1.3);
  width: var(--size);
  /* border-radius: calc(var(--size) * 0.15); */
  background-image: var(--img);
  background-size: cover;
  background-repeat: no-repeat;
  border: 1rem solid white;
  border-bottom: 3.5rem solid white;
}
.card {
  grid-gap: 10px;
  color: white;
  filter: grayscale(25%);
  font-family: "Open Sans", sans-serif;
  /* background: white; */
}
.card:hover {
  text-decoration: gray;

  filter: contrast(140%) saturate(150%)
    drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.475));
}

.search-bar {
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
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(20rem, 1fr));
  grid-gap: 1rem;
  max-width: 80rem;
  margin: 5rem auto;
  padding: 10 5rem;
  filter: grayscale(50%);
}

h1 {
  font-family: "Poiret One", cursive;
  font-size: 5vw;
}
#search {
  font-family: "Poiret One", cursive;
  font-size: 1.5vw;
  font-weight: bold;
  color: white;
}

.title {
  color: black;
  text-decoration: none;
  font-size: 23px;
  position: relative;
  bottom: 79px;
  z-index: 3;
  font-family: 'Rock Salt', cursive;
}

.button-itinerary {
  padding: .5rem;
  font-size: 15px;
  border: none;
  border-radius: 10px;
  position: relative;
  top: 3.5rem;
  left: 8.4rem;
  z-index: 3;
}

.bring-forward {
  /* filter: opacity(50%); */
  position: absolute;
  top: 6.3rem;
  left: 275px;
  z-index: 4;
  width: 30%;
}
</style>