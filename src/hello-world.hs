module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS

main :: IO ()
main = do
    w <- windowNew (toSize (100, 100)) Nothing Nothing
    let funcs = defaultCustomWidgetFuncs {handleCustom = Just handleEv}
    _ <- buttonCustom
            (toRectangle (30, 30, 40, 40))
            Nothing Nothing (Just funcs)
    end w
    showWidget w
    _ <- FL.run
    return ()

drawF :: Ref Button -> IO ()
drawF = drawSuper

handleEv :: Ref Button -> Event -> IO Int
handleEv w ev = do
    print ev
    handleSuper w ev
