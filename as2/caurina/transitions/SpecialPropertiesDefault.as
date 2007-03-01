/**
 * SpecialPropertiesDefault
 * List of default special property modifiers for the Tweener class
 * The function names are strange/inverted because it makes for easier debugging (alphabetic order). They're only for internal use (on this class) anyways.
 *
 * @author		Zeh Fernando, Nate Chatellier
 * @version		1.0.1
 */

import caurina.transitions.Tweener;
import caurina.transitions.AuxFunctions;

class caurina.transitions.SpecialPropertiesDefault {

	/**
	 * There's no constructor.
	 */
	public function SpecialPropertiesDefault () {
		trace ("SpecialProperties is an static class and should not be instantiated.")
	}

	/**
	 * Registers all the modifiers to the Tweener class, so the Tweener knows what to do with them.
	 */
	public static function init():Void {
		Tweener.registerSpecialProperty("_frame", _frame_get, _frame_set);
		Tweener.registerSpecialProperty("_sound_volume", _sound_volume_get, _sound_volume_set);
		Tweener.registerSpecialProperty("_sound_pan", _sound_pan_get, _sound_pan_set);
		Tweener.registerSpecialProperty("_color_ra", _color_ra_get, _color_ra_set);
		Tweener.registerSpecialProperty("_color_rb", _color_rb_get, _color_rb_set);
		Tweener.registerSpecialProperty("_color_ga", _color_ga_get, _color_ga_set);
		Tweener.registerSpecialProperty("_color_gb", _color_gb_get, _color_gb_set);
		Tweener.registerSpecialProperty("_color_ba", _color_ba_get, _color_ba_set);
		Tweener.registerSpecialProperty("_color_bb", _color_bb_get, _color_bb_set);
		Tweener.registerSpecialProperty("_color_aa", _color_aa_get, _color_aa_set);
		Tweener.registerSpecialProperty("_color_ab", _color_ab_get, _color_ab_set);
		Tweener.registerSpecialPropertySplitter("_color", _color_splitter);
		Tweener.registerSpecialPropertySplitter("_colorTransform", _colorTransform_splitter);
	}

	// ==================================================================================================================================
	// PROPERTY GROUPING/SPLITTING functions --------------------------------------------------------------------------------------------

	// ----------------------------------------------------------------------------------------------------------------------------------
	// _color

	/**
	 * Splits the _color parameter into specific color variables
	 *
	 * @param		p_value				Number		The original _color value
	 * @return							Array		An array containing the .name and .value of all new properties
	 */
	public static function _color_splitter (p_value:Object):Array {
		var nArray:Array = new Array();
		if (p_value == null) {
			// No parameter passed, so just resets the color
			nArray.push({name:"_color_ra", value:100});
			nArray.push({name:"_color_rb", value:0});
			nArray.push({name:"_color_ga", value:100});
			nArray.push({name:"_color_gb", value:0});
			nArray.push({name:"_color_ba", value:100});
			nArray.push({name:"_color_bb", value:0});
		} else {
			// A color tinting is passed, so converts it to the object values
			nArray.push({name:"_color_ra", value:0});
			nArray.push({name:"_color_rb", value:AuxFunctions.numberToR(p_value)});
			nArray.push({name:"_color_ga", value:0});
			nArray.push({name:"_color_gb", value:AuxFunctions.numberToG(p_value)});
			nArray.push({name:"_color_ba", value:0});
			nArray.push({name:"_color_bb", value:AuxFunctions.numberToB(p_value)});
		}
		return nArray;
	}

	// ----------------------------------------------------------------------------------------------------------------------------------
	// _colorTransform

	/**
	 * Splits the _colorTransform parameter into specific color variables
	 *
	 * @param		p_value				Number		The original _colorTransform value
	 * @return							Array		An array containing the .name and .value of all new properties
	 */
	public static function _colorTransform_splitter (p_value:Object):Array {
		var nArray:Array = new Array();
		if (p_value == null) {
			// No parameter passed, so just resets the color
			nArray.push({name:"_color_ra", value:100});
			nArray.push({name:"_color_rb", value:0});
			nArray.push({name:"_color_ga", value:100});
			nArray.push({name:"_color_gb", value:0});
			nArray.push({name:"_color_ba", value:100});
			nArray.push({name:"_color_bb", value:0});
		} else {
			// A color tinting is passed, so converts it to the object values
			if (p_value.ra != undefined) nArray.push({name:"_color_ra", value:p_value.ra});
			if (p_value.rb != undefined) nArray.push({name:"_color_rb", value:p_value.rb});
			if (p_value.ga != undefined) nArray.push({name:"_color_ba", value:p_value.ba});
			if (p_value.gb != undefined) nArray.push({name:"_color_bb", value:p_value.bb});
			if (p_value.ba != undefined) nArray.push({name:"_color_ga", value:p_value.ga});
			if (p_value.bb != undefined) nArray.push({name:"_color_gb", value:p_value.gb});
			if (p_value.aa != undefined) nArray.push({name:"_color_aa", value:p_value.aa});
			if (p_value.ab != undefined) nArray.push({name:"_color_ab", value:p_value.ab});
		}
		return nArray;
	}

	// ==================================================================================================================================
	// PROPERTY MODIFICATION functions --------------------------------------------------------------------------------------------------

	// ----------------------------------------------------------------------------------------------------------------------------------
	// _frame

	/**
	 * Returns the current frame number from the movieclip timeline
	 *
	 * @param		p_obj				Object		MovieClip object
	 * @return							Number		The current frame
	 */
	public static function _frame_get (p_obj:Object):Number {
		return p_obj._currentFrame;
	}

	/**
	 * Sets the timeline frame
	 *
	 * @param		p_obj				Object		MovieClip object
	 * @param		p_value				Number		New frame number
	 */
	public static function _frame_set (p_obj:Object, p_value:Number):Void {
		p_obj.gotoAndStop(Math.round(p_value));
	}

	
	// ----------------------------------------------------------------------------------------------------------------------------------
	// _sound_volume

	/**
	 * Returns the current sound volume
	 *
	 * @param		p_obj				Object		Sound object
	 * @return							Number		The current volume
	 */
	public static function _sound_volume_get (p_obj:Object):Number {
		return p_obj.getVolume();
	}

	/**
	 * Sets the sound volume
	 *
	 * @param		p_obj				Object		Sound object
	 * @param		p_value				Number		New volume
	 */
	public static function _sound_volume_set (p_obj:Object, p_value:Number):Void {
		p_obj.setVolume(p_value);
	}


	// ----------------------------------------------------------------------------------------------------------------------------------
	// _sound_pan

	/**
	 * Returns the current sound pan
	 *
	 * @param		p_obj				Object		Sound object
	 * @return							Number		The current pan
	 */
	public static function _sound_pan_get (p_obj:Object):Number {
		return p_obj.getPan();
	}

	/**
	 * Sets the sound volume
	 *
	 * @param		p_obj				Object		Sound object
	 * @param		p_value				Number		New pan
	 */
	public static function _sound_pan_set (p_obj:Object, p_value:Number):Void {
		p_obj.setPan(p_value);
	}


	// ----------------------------------------------------------------------------------------------------------------------------------
	// _color_*

	/**
	 * _color_ra
	 * RA component of the colorTransform object
	 */
	public static function _color_ra_get (p_obj:Object):Number {
		return (new Color(p_obj)).getTransform().ra;
	}
	public static function _color_ra_set (p_obj:Object, p_value:Number):Void {
		var cfObj:Object = new Object();
		cfObj.ra = Math.round(p_value);
		(new Color(p_obj)).setTransform(cfObj);
	}

	/**
	 * _color_rb
	 * RB component of the colorTransform object
	 */
	public static function _color_rb_get (p_obj:Object):Number {
		return (new Color(p_obj)).getTransform().rb;
	}
	public static function _color_rb_set (p_obj:Object, p_value:Number):Void {
		var cfObj:Object = new Object();
		cfObj.rb = Math.round(p_value);
		(new Color(p_obj)).setTransform(cfObj);
	}

	/**
	 * _color_ga
	 * GA component of the colorTransform object
	 */
	public static function _color_ga_get (p_obj:Object):Number {
		return (new Color(p_obj)).getTransform().ga;
	}
	public static function _color_ga_set (p_obj:Object, p_value:Number):Void {
		var cfObj:Object = new Object();
		cfObj.ga = Math.round(p_value);
		(new Color(p_obj)).setTransform(cfObj);
	}

	/**
	 * _color_gb
	 * GB component of the colorTransform object
	 */
	public static function _color_gb_get (p_obj:Object):Number {
		return (new Color(p_obj)).getTransform().gb;
	}
	public static function _color_gb_set (p_obj:Object, p_value:Number):Void {
		var cfObj:Object = new Object();
		cfObj.gb = Math.round(p_value);
		(new Color(p_obj)).setTransform(cfObj);
	}

	/**
	 * _color_ba
	 * BA component of the colorTransform object
	 */
	public static function _color_ba_get (p_obj:Object):Number {
		return (new Color(p_obj)).getTransform().ba;
	}
	public static function _color_ba_set (p_obj:Object, p_value:Number):Void {
		var cfObj:Object = new Object();
		cfObj.ba = Math.round(p_value);
		(new Color(p_obj)).setTransform(cfObj);
	}

	/**
	 * _color_bb
	 * BB component of the colorTransform object
	 */
	public static function _color_bb_get (p_obj:Object):Number {
		return (new Color(p_obj)).getTransform().bb;
	}
	public static function _color_bb_set (p_obj:Object, p_value:Number):Void {
		var cfObj:Object = new Object();
		cfObj.bb = Math.round(p_value);
		(new Color(p_obj)).setTransform(cfObj);
	}

	/**
	 * _color_aa
	 * AA component of the colorTransform object
	 */
	public static function _color_aa_get (p_obj:Object):Number {
		return (new Color(p_obj)).getTransform().aa;
	}
	public static function _color_aa_set (p_obj:Object, p_value:Number):Void {
		var cfObj:Object = new Object();
		cfObj.aa = Math.round(p_value);
		(new Color(p_obj)).setTransform(cfObj);
	}

	/**
	 * _color_ab
	 * AB component of the colorTransform object
	 */
	public static function _color_ab_get (p_obj:Object):Number {
		return (new Color(p_obj)).getTransform().ab;
	}
	public static function _color_ab_set (p_obj:Object, p_value:Number):Void {
		var cfObj:Object = new Object();
		cfObj.ab = Math.round(p_value);
		(new Color(p_obj)).setTransform(cfObj);
	}
}
