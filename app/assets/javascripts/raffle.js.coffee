app = angular.module('Raffler', ['ngResource'])

app.factory 'Entry', ($resource) ->
	$resource('/entries/:id', {id: "@id"}, {update: {method: "PUT"}})

@RaffleGtrl = ($scope, Entry) ->
	$scope.entries = Entry.query()
	

	$scope.addEntry = ->
		if $scope.entries.indexOf($scope.newEntry) == -1
		  entry = Entry.save($scope.newEntry)
		  $scope.entries.push(entry)
		  $scope.newEntry = {}
		else
		  $scope.newEntry.$update()


  $scope.editEntry = (entry) ->
  	$scope.newEntry = entry
  	console.log(entry)

	$scope.deleteEntry = (entry) ->
		index = $scope.entries.indexOf(entry)
		$scope.entries.splice(index, 1)
		entry.$delete()

	$scope.drawWinner = ->
		pool = []
		angular.forEach $scope.entries, (entry) ->
			pool.push(entry)
		if pool.length > 0
			entry = pool[Math.floor(Math.random()*$scope.entries.length)]
			entry.winner = true
			entry.win_times += 1
			entry.$update()
			$scope.lastWinner = entry

@default = ($scope) ->
  $scope.newEntry = {}