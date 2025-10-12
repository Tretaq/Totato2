extends Label

func _process(delta):
    self.text = "score =" + str(Global.score)