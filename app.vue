<template>
  <section class="container">
    <div v-if="exercises.length > 0">
      <div class="row">
        <div v-for="exercise in exercises" :key="exercise.name" class="col s12 l6">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
                <span class="card-title">{{ exercise.name }}</span>
                <p v-if="exercise.target">{{ exercise.target }} {{ exercise.measure }}</p>
                <p v-else>-</p>
            </div>
            <div class="card-action">
              <span class="chip green z-depth-1">{{ exercise.consumed }} consumed</span>
              <span v-if="exercise.target" class="chip pink z-depth-1">{{ exercise.target - exercise.consumed }} remining</span>
              <a :href="`#add-amount-${exercise.name}`" :data-add-amount="`add-amount-${exercise.name}`" class="btn btn-small btn-floating right waves-effect waves-light modal-trigger">
                <i class="material-icons">add</i>
              </a>
              <div :id="`add-amount-${exercise.name}`" class="modal add-amount">
                <div class="modal-content valign-wrapper container">
                  <div class="input-field inline">
                    <input :id="`input-${exercise.name}`" type="number">
                    <label :for="`input-${exercise.name}`">{{ exercise.name }}</label>
                  </div>
                  <div class="input-field inline">
                    <button class="btn btn-floating btn-small modal-close" type="submit"><i class="material-icons">send</i></button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.modal');
    var instances = M.Modal.init(elems);
});

export default {
  name: 'App',
  data: () => ({
    userName: null,
    exercises: [
      {
        name: 'HSPU',
        measure: 'reps',
        target: 100,
        consumed: 10,
      },
      {
        name: 'Burpees',
        measure: 'reps',
        target: null,
        consumed: 10,
      },
      {
        name: 'Push-ups',
        measure: 'reps',
        target: 50,
        consumed: 10,
      },
    ],
    measures: [
      'reps',
      'seconds',
    ],
  }),
  methods: {
  },
  mounted: function() {
    if (localStorage.sportsperson) {
      this.sportsperson = JSON.parse(localStorage.sportsperson);
    }
  },
  updated: function() {
    localStorage.sportsperson = JSON.stringify(this.sportsperson);
  },
};
</script>

<style lang="scss">
  @import './node_modules/materialize-css/sass/materialize.scss';

  .add-amount {
    max-width: 300px;

    .modal-content {
      padding: 1rem 0 0;
    }
  }
</style>