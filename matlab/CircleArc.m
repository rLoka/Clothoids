classdef CircleArc < handle
  % clothoid: MATLAB class wrapper to the underlying C++ class
  properties (SetAccess = private, Hidden = true)
    objectHandle; % Handle to the underlying C++ class instance
  end
    
  methods
    %% Constructor - Create a new C++ class instance
    function this = CircleArc( varargin )
      % clothoid: constructor for the clothoid object.
      % Usage:
      %    (1) ref = CircleArc()
      %    (2) ref = CircleArc( x0, y0, theta0, k0, L )
      %    (3) ref = CircleArc( x0, y0, theta0, k0, smin, smax )
      %    (4) ref = CircleArc( p0, p1, p2 )
      %    (5) ref = CircleArc( p0, theta0, p1 )
      %
      % On input:
      %    x0, y0: coordinate of initial point
      %    theta0: orientation of the circle at initial point
      %    k0:     curvature of the circle at initial point
      %    L:      length of curve from initial to final point
      %    smin:   initial curvilinear coordinate of the curve
      %    smax:   final curvilinear coordinate of the curve
      %    p0:     2D point
      %    p1:     2D point
      %    p2:     2D point
      %
      %    (1) empty circle
      %    (2) circle passing from (x0,y0) at angle theta0 with curvature and length
      %    (3) circle as in (2) with intial and final curvaturevilinear coordinate respect to (x0,y0)
      %    (4) circle arc passing from 3 points
      %    (5) circle passing to p0 and p1 with angle theta0 at p0
      %  On output:
      %    ref: reference handle to the object instance
      %
      this.objectHandle = CircleArcMexWrapper('new', varargin{:} );
    end
        
    %% Destructor - Destroy the C++ class instance
    function delete(this)
      CircleArcMexWrapper('delete', this.objectHandle );
    end
        
    %% Build
    function build( this, varargin )
      % build: method to build the clothoid from known parameters
      % Usage:
      %    (1) ref.build( x0, y0, theta0, k0, L )
      %    (2) ref.build( x0, y0, theta0, k0, smin, smax )
      %    (3) ref.build( p0, p1, p2 )
      %    (4) ref.build( p0, theta0, p1 )
      %
      % On input:
      %    x0, y0: coordinate of initial point
      %    theta0: orientation of the circle at initial point
      %    k0:     curvature of the circle at initial point
      %    L:      length of curve from initial to final point
      %    smin:   initial curvilinear coordinate of the curve
      %    smax:   final curvilinear coordinate of the curve
      %    p0:     2D point
      %    p1:     2D point
      %    p2:     2D point
      %
      %    (1) circle passing from (x0,y0) at angle theta0 with curvature and length
      %    (2) circle as in (2) with intial and final curvaturevilinear coordinate respect to (x0,y0)
      %    (3) circle arc passing from 3 points
      %    (4) circle passing to p0 and p1 with angle theta0 at p0
      CircleArcMexWrapper('build', this.objectHandle, varargin{:} );
    end

    function changeOrigin(this, x0, y0)
      % changeOrigin: method to change the origin of the clothoid 
      %               curve to s0
      % Usage:
      %    ref.changeOrigin(s0)
      %    
      % On input:
      %    s0: curvilinear coordinate of the origin of the new curve
            
      CircleArcMexWrapper('changeOrigin', this.objectHandle, x0, y0 );
    end

    function translate(this, tx, ty)
      CircleArcMexWrapper('translate', this.objectHandle, tx, ty );
    end

    function changeCurvilinearOrigin(this, s0 )
      CircleArcMexWrapper('changeCurvilinearOrigin', this.objectHandle, s0 );
    end

    function trim(this, smin, smax)
      CircleArcMexWrapper('trim', this.objectHandle, smin, smax );
    end

    function scale(this, sc)
      CircleArcMexWrapper('scale', this.objectHandle, sc );
    end
        
    function rotate(this, angle, cx, cy)
      % rotate: method to rotate the clothoid curve
      % Usage:
      %    ref.rotate(angle, cx, cy)
      %    
      % On input:
      %    angle: the angle of rotation
      %    cx, cy: coordinates of the centre of rotation
            
      CircleArcMexWrapper('rotate', this.objectHandle, angle, cx, cy );
    end

    function moveOrigin(this, newX0, newY0)
      % moveOrigin: method to move the origin of the clothoid curve 
      % Usage:
      %    ref.moveOrigin(newX0, newY0)
      %    
      % On input:
      %    newX0, newY0: new coordinates of initial point     
      CircleArcMexWrapper('moveOrigin', this.objectHandle, newX0, newY0 );
    end

    function [p0,p1,p2,ok] = bbTriangle(this)
      [p0,p1,p2,ok] = CircleArcMexWrapper('bbTriangle', this.objectHandle);
    end

    function nurbs = to_nurbs(this)
      nurbs = CircleArcMexWrapper('to_nurbs', this.objectHandle);
    end

    %% Eval
    function [X,Y] = eval(this, s)
      % eval: method to eval the curve at curvilinear abscissa s
      % Usage:
      %    [x,y] = ref.eval( s )
      %    
      % On input:
      %    s: curvilinear coordinates where to evaluate the curve
      %       (scalar or vector)
      %
      % On output:
      %    x, y:  coordinates of the curve 
      [X,Y] = ClothoidMexWrapper('eval', this.objectHandle, s );
    end

    %% Eval
    function [X,Y] = eval_D(this, s)
      [X,Y] = CircleArcMexWrapper('eval_D', this.objectHandle, s );
    end

    %% Eval
    function [X,Y] = eval_DD(this, s)
      [X,Y] = CircleArcMexWrapper('eval_DD', this.objectHandle, s );
    end

    %% Eval
    function [X,Y] = eval_DDD(this, s)
      [X,Y] = CircleArcMexWrapper('eval_DDD', this.objectHandle, s );
    end

    function [X,Y] = theta(this, s)
      [X,Y] = CircleArcMexWrapper('theta', this.objectHandle, s );
    end
 
    function res = getX0(this)
      res = CircleArcMexWrapper('getX0', this.objectHandle );
    end
 
    function res = getY0(this)
      res = CircleArcMexWrapper('getY0', this.objectHandle );
    end
 
    function res = getTheta0(this)
      res = CircleArcMexWrapper('getTheta0', this.objectHandle );
    end
 
    function res = getKappa(this)
      res = CircleArcMexWrapper('getKappa', this.objectHandle );
    end
 
    function res = getSmin(this)
      res = CircleArcMexWrapper('getSmin', this.objectHandle );
    end
 
    function res = getSmax(this)
      res = CircleArcMexWrapper('getSmax', this.objectHandle );
    end
 
    function res = length(this)
      res = CircleArcMexWrapper('length', this.objectHandle );
    end

    %% Utils
    function lineH = plot(this,varargin)
      % plot: method to plot the clothoid curve
      % Usage:
      %    lineH = ref.plot()
      %    lineH = ref.plot(0.2)
      %    lineH = ref.plot(0.2, 'r', 'LineWidth', 3)
      %    
      % On input:
      %    step:     the distance between consecutive samples used to
      %              draw the curve
      %    varargin: optional arguments passed to the MATLAB plot
      %              function
      %
      % On output:
      %    lineH: the handle to the line object 
      %           (i.e. the output of the MATLAB plot function)
      arc = this.to_nurbs() ;
      breaks = fnbrk(arc,'b');
      col = 'b';
      lw  = 1;
      if nargin>1 ; col = varargin{1} ; end
      if nargin>2 ; lw  = varargin{2} ; end
      fnplt(arc,[breaks(1),breaks(end)],col,lw);
      hold on;
      % plot poligono
      xx = arc.coefs(1,:)./arc.coefs(3,:);
      yy = arc.coefs(2,:)./arc.coefs(3,:);
      plot(xx,yy,':ok','Color',col);
    end
  end
end