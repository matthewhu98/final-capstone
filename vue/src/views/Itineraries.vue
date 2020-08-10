<template>
  <section class="itinerary">
    <h1 class="text">Your Itineraries</h1>

    <div>
      <itinerary-list  ></itinerary-list>
    </div>
  </section>
</template>

<script>
import ItineraryList from "@/components/ItineraryList.vue";
export default {
  name: "itineraries",
  components: {
    ItineraryList
  }
};
</script>

<style>
.text {
  color: black;
}
</style>