FROM neubiaswg5/fiji-base:latest

RUN cd plugins && wget -O imagescience.jar https://imagescience.org/meijering/software/download/imagescience.jar
RUN cd plugins && wget -O FeatureJ_.jar https://imagescience.org/meijering/software/download/FeatureJ_.jar

ADD IJSpotDetection.ijm /fiji/macros/IJSpotDetection.ijm                                           
ADD run-spot-detection.sh /fiji/run-spot-detection.sh
RUN cd /fiji && chmod a+x run-spot-detection.sh

ENTRYPOINT ["/bin/sh", "/fiji/run-spot-detection.sh"]
