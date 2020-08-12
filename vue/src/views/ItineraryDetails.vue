<template>
  <div class="itinerary-details details-backgroung">
      <div>
          <itinerary-details v-bind:itineraryID="parseInt($route.params.id)"/>
      </div>
  </div>
</template>

<script>
import ItineraryDetails from '@/components/ItineraryDetails.vue';
export default {
    name: 'itinerarydetails',
    components: {
        ItineraryDetails
    }
}
</script>

<style>
.details-backgroung{
  
  background-image: url(../assets/background-itinerary-details.jpg);
  background-repeat: no-repeat;
  /* background-position: center; */
  /* background-size: 50vw; */
  max-width: 100%;
  /* max-height: 20%; */
  /* width: 100vw; */
  background-size:cover ;
  background-attachment: fixed;

}
</style>