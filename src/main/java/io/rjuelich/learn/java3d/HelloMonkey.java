package io.rjuelich.learn.java3d;

import com.jme3.app.SimpleApplication;
import com.jme3.scene.Spatial;

public class HelloMonkey extends SimpleApplication {

	public static void main(final String[] args) {
		new HelloMonkey().start();
	}
	
	@Override
	public void simpleInitApp() {
		final Spatial monkey = getAssetManager().loadModel("Scenes/monkey.blend");
		getRootNode().attachChild(monkey);
	}

}
