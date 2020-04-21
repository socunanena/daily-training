<template>
  <section class="section">
    <div class="container">
      <section class="section">
        <div class="container">
          <div class="field has-addons">
            <div class="control">
              <input class="input" type="text" placeholder="New person" v-model="newPersonName" v-on:keyup.enter="addSportsperson">
            </div>
          </div>
        </div>
      </section>
      <section class="section" v-for="person in sportsperson" :key="person.name">
        <div class="container">
          <h1 class="title">
            {{ person.name }}
          </h1>
          <table class="table is-fullwidth">
            <thead>
              <tr>
                <th>Exercise</th>
                <th>Target</th>
                <th>Consumed</th>
                <th>Remaining</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="exercise in person.exercises" :key="exercise.name" class="is-vertical-center">
                <th>{{ exercise.name }}</th>
                <td>{{ exercise.targetReps }}</td>
                <td>{{ exercise.consumedReps }}</td>
                <td>{{ exercise.targetReps - exercise.consumedReps }}</td>
                <td>
                  <div class="field has-addons">
                    <div class="control">
                      <input class="input" type="number" v-model="exercise.repsToAdd" v-on:keyup.enter="addReps(exercise)">
                    </div>
                    <div class="control">
                      <button class="button is-primary" v-on:click="addReps(exercise)">+</button>
                    </div>
                  </div>
                </td>
                <td><button class="button is-danger" v-on:click="deleteExercise(person, exercise)">x</button></td>
              </tr>
              <tr>
                <td><input class="input" type="text" placeholder="Exercise name" v-model="person.newExercise.name" v-on:keyup.enter="addExercise(person)"></td>
                <td><input class="input" type="number" placeholder="Target reps" v-model="person.newExercise.reps" v-on:keyup.enter="addExercise(person)"></td>
                <td><button class="button is-primary" v-on:click="addExercise(person)">Add exercise</button></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </section>
</template>

<script>
export default {
  name: 'App',
  data: () => ({
    newPersonName: null,
    sportsperson: [],
  }),
  methods: {
    addSportsperson: function() {
      if (!this.newPersonName) {
        return;
      }

      this.sportsperson.push({
        name: this.newPersonName,
        exercises: [],
        newExercise: {},
      });

      this.newPersonName = null;
    },
    addExercise: function(person) {
      if (!person.newExercise.name || !person.newExercise.reps) {
        return;
      }

      person.exercises.push({
        name: person.newExercise.name,
        targetReps: person.newExercise.reps,
        consumedReps: 0,
      });

      person.newExercise = {};
    },
    deleteExercise: function(person, exercise) {
      const personToUpdate = this.sportsperson.find(p => p.name === person.name);

      personToUpdate.exercises = personToUpdate.exercises.filter(e => e.name !== exercise.name);
    },
    addReps: function(exercise) {
      if (!exercise.repsToAdd) {
        return;
      }

      exercise.consumedReps += +exercise.repsToAdd;

      exercise.repsToAdd = null;
    },
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

<style scoped>
  @import './node_modules/bulma/bulma';

  th, td {
    vertical-align: middle;
  }
</style>