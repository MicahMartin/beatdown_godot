extends Node

var playerNames = ["", ""]
var isNetPlay = false
var localPort : int = 4269
var remotePort : int = 4270
var remoteIp = "127.0.0.1"
var netPnum : int = 1

func setPlayerName(playerNum, playerName):
	playerNames[playerNum] = playerName
	pass

func getPlayerName(playerNum):
	return playerNames[playerNum]
	
	
func setNetplay(netPlay):
	isNetPlay = netPlay
	pass
	
	
func getNetPlay():
	return isNetPlay
	
func setLocalPort(_localPort):
	localPort = _localPort as int
	pass
	
	
func getLocalPort():
	return localPort
	
func setRemotePort(_remotePort):
	remotePort = _remotePort as int
	pass
	
	
func getRemotePort():
	return remotePort

func setRemoteIp(_remoteIp):
	remoteIp = _remoteIp
	
func getRemoteIp():
	return remoteIp
	
func setNetPnum(_netPnum):
	netPnum = _netPnum as int

func getNetPnum():
	return netPnum
	
